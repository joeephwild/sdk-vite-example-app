import { createContext, useState, useEffect, useContext } from "react";
import {
  getHuddleClient,
} from "@huddle01/huddle01-client";

import { useHuddleStore } from "@huddle01/huddle01-client/store";

const stateContext = createContext();

export const StateContextProvider = ({ children }) => {
  const huddleClient = getHuddleClient(
    "e5f348aa5626aaa775a09e9515f224933d25b7c40792bbf886a5e74c83827720"
  );
  const peersKeys = useHuddleStore((state) => Object.keys(state.peers));
  const lobbyPeers = useHuddleStore((state) => state.lobbyPeers);
  const roomState = useHuddleStore((state) => state.roomState);
  const recordingState = useHuddleStore((state) => state.recordingState);
  const recordings = useHuddleStore((state) => state.recordings);

  const handleJoin = async () => {
    try {
      await huddleClient.join("dev", {
        address: "0x15900c698ee356E6976e5645394F027F0704c8Eb",
        wallet: "",
        ens: "axit.eth",
      });

      console.log("joined");
    } catch (error) {
      console.log({ error });
    }
  };

  return <stateContext.Provider value={{
    handleJoin,
    huddleClient,
    peersKeys,
    lobbyPeers,
    roomState,
    recordingState,
    recordings
  }}>
    {children}
  </stateContext.Provider>;
};

export const useStateContext = () => useContext(stateContext)