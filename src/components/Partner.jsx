import React from "react";
import { partner1, partner2, partner3 } from "../assets";

const Partner = () => {
  return (
    <div className="w-full my-3 flex-col items-center ">
      <h3 className="text-sm font-bold font-HankenGrotesk-Bold mb-6 text-center">
        These companies work with us to make us grow.
      </h3>
      <div className="bg-white w-[60%] h-20 relative rounded-full overflow-x-hidden mx-auto">
      <marquee behavior="smooth" direction="left">
        <div className="flex  w-full mb-6 mx-9 items-center justify-center gap-6">
          <img src={partner1} alt="partner" className="h-11" />
          <img src={partner2} alt="partner" className="h-24 object-contain" />
          <img src={partner3} alt="partner" className="h-11" />
          <img src={partner1} alt="partner" className="h-11" />
          <img src={partner2} alt="partner" className="h-24 object-contain" />
          <img src={partner1} alt="partner" className="h-11" />
          <img src={partner1} alt="partner" className="h-11" />
        </div>
      </marquee>
      </div>
      
    </div>
  );
};

export default Partner;
