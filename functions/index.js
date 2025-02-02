
const functions = require("firebase-functions");

const { moveGuestToUser } = require("./firestore/moveGuestToUser");
const { createUserWithPhoneNumber } = require("./auth/createUserClientSide");
const { canUserAuthenticate } = require("./auth/canAuthenticate");

exports.moveGuestToUser = moveGuestToUser;
exports.canUserAuthenticate = canUserAuthenticate;     
exports.createUserWithPhoneNumber = createUserWithPhoneNumber;


