import React from "react";
import { logo } from "../assets";
import { CustomButton } from "../components";

const address = ''
const Header = () => {
  return (
    <nav className="flex items-center px-4 bg-black justify-between w-full top-0 fixed gap-6">
      <div className="flex items-center">
        <img src={logo} alt="logo" className="w-20 h-20 pb-2 object-contain" />
      </div>
      {/** links */}
      <ul className="md:flex hidden items-center flex-grow font-HankenGrotesk-Bold space-x-9 cursor-pointer text-sm font-bold ml-4">
          <li>Home</li>
          <li>Jobs</li>
          <li>Employers</li>
          <li>Candidate</li>
          <li>Faq</li>
        </ul>
        {/** left section */}
      <div className="flex items-end justify-end">
        <CustomButton
          btnType="button" 
          title={address ? "Create Account" : "Connect wallet"}         
          styles={address ? "bg-[#1dc071]" : "bg-[#8c6dfd]"}
          handleClick={() => {
            if (address) navigate("/create-Account");
            else connect();
          }}
        />
      </div>
    </nav>
  );
};

export default Header;
