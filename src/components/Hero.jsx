import React from "react";
import { service } from "../assets";
import { HeroText } from "../components";

const Hero = () => {
  return (
    <div className="mt-24 mx-6">
      <div className="grid md:grid-cols-2 space-x-6 items-center">
        <HeroText />
        <img
          src={service}
          alt="service"
          className="lg:h-[500px] md:[400px] w-full  object-cover "
        />
      </div>
    </div>
  );
};

export default Hero;
