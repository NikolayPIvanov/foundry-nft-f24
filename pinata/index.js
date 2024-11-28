const { PinataSDK } = require("pinata-web3");
const fs = require("fs");
require("dotenv").config();

const pinata = new PinataSDK({
  pinataJwt: process.env.PINATA_JWT,
  pinataGateway: process.env.GATEWAY_URL,
});

async function upload() {
  try {
    // const imageBlob = new Blob([fs.readFileSync("./data/nimbus.jpeg")]);
    // const nimbusFile = new File([imageBlob], "nimbus.jpeg", {
    //   type: "image/jpeg",
    // });
    // const uploadImage = await pinata.upload.file(nimbusFile, {
    //   cidVersion: 1,
    // });
    // console.log(uploadImage);

    const blob = new Blob([fs.readFileSync("./data/purarri.json")]);
    const file = new File([blob], "purarri.json", {
      type: "application/json",
    });
    const upload = await pinata.upload.file(file, {
      cidVersion: 1,
    });
    console.log(upload);
  } catch (error) {
    console.log(error);
  }
}

upload();
