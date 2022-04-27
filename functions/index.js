const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.newProjectNotification = functions.firestore
    .document("project/{projectId}")
    .onCreate((snapshot, context) => {
      const notification = {
        title: "New Project",
        body: `A new project -${snapshot.data()["name"]}- has been added`,
      };

      if (snapshot.data()["image"] != null) {
        notification["imageUrl"] = snapshot.data()["image"];
      }

      admin.messaging().send({
        data: {
          "projectId": snapshot.id,
        },
        topic: "project",
        notification: notification,
      });
    });
