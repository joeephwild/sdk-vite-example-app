import React from "react";
import { service } from "../assets";
import { HeroText } from "../components";

const Hero = () => {
  function sendPushNotification() {
    navigator.serviceWorker.getRegistration().then(function (registration) {
      registration.showNotification("Push notification received!");
    });
  }
  return (
      <div className="grid md:grid-cols-2 space-x-4 items-center">
        <HeroText />
        <img
          src={service}
          alt="service"
          className=" h-  w-full px-8 py- object-cover "
        />
      </div>
  );
};

export default Hero;
