const { user } = require("firebase-functions/v1/auth");

module.exports = {
    Firestore: {
        collection: {
            USERS: "users",
            GUESTS: "guests",
            FEEDBACKS : "feedbacks",
        }
    },
    DOCUMENT: {
      user: {
          role: "role",
          uid: "uid",
            phoneNumber: "phoneNumber",
            gender: "gender",
            name: "name",
            memberNumber: "memberNumber",
            membershipStartDate: "membershipStartDate",
            membershipEndDate: "membershipEndDate",
            members: "members",
            mentorId: "mentorId",

      },  
    },
    ROLES: {
        GUEST: "guest",
        APPROVED_GUEST: "approvedGuest",
        MEMBER: "member",
        ADMIN: "admin",
    },
    ERROR_CODES: {
        PHONE_NUMBER_REQUIRED: "phone-number-required",
        USER_ALREADY_EXISTS: "user-already-exists",
        USER_NOT_FOUND: "user-not-found",
    }

}

