function getAvatar(username: string) {
  return localStorage.getItem("avatar:" + username) ?? "";
}

function saveAvatar(username: string, avatar: File) {
  getBase64(avatar).then((base64) => localStorage.setItem("avatar:" + username, base64 as string)).catch();
}

function deleteAvatar(username: string) {
    localStorage.removeItem("avatar:" + username);
}

const getBase64 = (file: File) => {
    return new Promise((resolve,reject) => {
       const reader = new FileReader();
       reader.onload = () => resolve(reader.result);
       reader.onerror = error => reject(error);
       reader.readAsDataURL(file);
    });
  }

export { getAvatar, saveAvatar, deleteAvatar };
