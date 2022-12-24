import React from "react";
import { service } from "../assets";
import { HeroText } from "../components";

const Hero = () => {
  return (
    <div className="">
      <div className="grid md:grid-cols-2 space-x-6 gap-3 items-center">
        <HeroText />
        <img
          src={service}
          alt="service"
          className=" h-full md:[400px] w-full px-8 py-24  lg:bg-white   object-cover "
        />

      </div>
    </div>
  );
};

export default Hero;
