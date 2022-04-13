import { compose, applyMiddleware } from "@reduxjs/toolkit";
import { createStore } from "redux";
import { persistStore, persistReducer } from "redux-persist";
import storage from "redux-persist/lib/storage"; // defaults to localStorage for web
import thunkMiddleware from "redux-thunk-recursion-detect";
import { encryptTransform } from "redux-persist-transform-encrypt";
import currentReducer from "./Redux.reducer";

const encryptConfig = {
  transforms: [
    encryptTransform({
      secretKey: "my-super-secret-key",
      onError: function (error) {
        console.log(error);
      },
    }),
  ],
};

const persistConfig = {
  key: "root",
  storage,
  ...encryptConfig,
};

const persistedReducer = persistReducer(persistConfig, currentReducer);

export const store = createStore(
  persistedReducer,
  compose(applyMiddleware(thunkMiddleware))
);
export const persistor = persistStore(store);
