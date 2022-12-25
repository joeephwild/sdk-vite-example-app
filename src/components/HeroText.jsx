import React from "react";
import { search } from "../assets";
import { CustomButton } from "../components";

const HeroText = () => {
  return (
    <div className="flex w-full mt-[60%] h-full flex-col items-center gap-3">
      <h2 className="text-4xl text-center font-bold font-Panchang-Extrabold items-center justify-center">
      Get your Web3 desired job with <span className="text-[#1dc071]">Carrer</span>UP.
      </h2>
      <span className="text-sm font-bold font-HankenGrotesk-Bold items-center text-center">
        Apply for jobs with just on click, schedule a token-gated interview with
        huddle01 video streaming.
      </span>
      <div className="flex gap-11 items-center">
        <CustomButton
          btnType="button"
          title="Create an Account"
          styles="text-sm bg-[#1dc071]"
        />
        <CustomButton
          btnType="button"
          title="Start an Interview"
          styles="text-sm border-2 border-[#1dc071]"
        />
      </div>
      <div className="flex space-x-4 px-4 items-center  py-2.5 w-[80%] md:w-full rounded-full bg-white">
        <div className='bg-[#1dc071] p-1.5 cursor-pointer rounded-full'> 
        <img 
        src={search} 
        alt="search"
        className="h-6 w-6"
         />
        </div>
        <input 
        type="text" 
        placeholder="Search Frontend Web3 developer Blockchain developer"
        className='border-none outline-none bg-transparent w-full' />
      </div>
    </div>
  );
};

export default HeroText;
