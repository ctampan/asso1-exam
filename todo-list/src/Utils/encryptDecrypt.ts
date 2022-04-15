function encrypt(str: string) {
  return btoa(encodeURIComponent(str));
}

function decrypt(str: string) {
  return decodeURIComponent(atob(str));
}

export { encrypt, decrypt };
