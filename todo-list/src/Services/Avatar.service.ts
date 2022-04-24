import PouchDB from "pouchdb";

let db = new PouchDB("todo");

interface AvatarDTO {
  _id: string;
  avatar: string;
}

async function getAvatar(username: string) {
  try {
    return (await db.get<AvatarDTO>(username)).avatar;
  } catch (error) {
    return "";
  }
}

function saveAvatar(username: string, avatar: File) {
  getBase64(avatar).then(async (base64) => {
    try {
      let existingData = await db.get<AvatarDTO>(username);

      existingData.avatar = base64 as string;

      db.put(existingData);
    } catch (error) {
      const doc = {
        _id: username,
        avatar: base64 as string,
      };

      db.put(doc);
    }
    localStorage.setItem("avatar:" + username, base64 as string);
  });
}

function deleteAvatar(username: string) {
  db.get<AvatarDTO>(username)
    .then((data) => {
      data.avatar = "";
      db.put(data);
    })
    .catch((error) => {});
}

const getBase64 = (file: File) => {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = (error) => reject(error);
    reader.readAsDataURL(file);
  });
};

export { getAvatar, saveAvatar, deleteAvatar };
