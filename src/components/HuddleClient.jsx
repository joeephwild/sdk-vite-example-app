import React from "react";
import { HuddleClientProvider } from "@huddle01/huddle01-client";

import PeerVideoAudioElem from "./PeerVideoAudioElem";
import MeVideoElem from "./MeVideoElem";
import { useStateContext } from "../context";

const HuddleClient = () => {
  const {
    handleJoin,
    huddleClient,
    peersKeys,
    lobbyPeers,
    roomState,
    recordingState,
    recordings,
  } = useStateContext();
  return (
    <div>
      <HuddleClientProvider value={huddleClient}>
      <div className="App grid grid-cols-2">
        <div>
          <h2 className={`text-${!roomState.joined ? "red" : "green"}`}>
            Room Joined:&nbsp;{roomState.joined.toString()}
          </h2>
        </div>
        <div>
        <div className="card">
            <button onClick={handleJoin}>Join Room</button>
            <button onClick={() => huddleClient.enableWebcam()}>
              Enable Webcam
            </button>
            <button onClick={() => huddleClient.disableWebcam()}>
              Disable Webcam
            </button>
            <button onClick={() => huddleClient.allowAllLobbyPeersToJoinRoom()}>
              allowAllLobbyPeersToJoinRoom()
            </button>
            <button
              onClick={() =>
                // will not work in localhost
                huddleClient.startRecording({
                  sourceUrl: window.location.href,
                })
              }
            >
              startRecording()
            </button>
            <button onClick={() => huddleClient.stopRecording({ ipfs: true })}>
              stopRecording()
            </button>
          </div>

          <MeVideoElem />

          {lobbyPeers[0] && <h2>Lobby Peers</h2>}
          <div>
            {lobbyPeers.map((peer) => (
              <div>{peer.peerId}</div>
            ))}
          </div>

          {peersKeys[0] && <h2>Peers</h2>}

          <div className="peers-grid">
            {peersKeys.map((key) => (
              <PeerVideoAudioElem key={`peerId-${key}`} peerIdAtIndex={key} />
            ))}
          </div>
          <div className="text-blue">
            <h2>Recording State</h2>
            <h3>inProgress: {recordingState.inProgress.toString()}</h3>
            <h3>processing: {recordingState.processing.toString()}</h3>
            <h3>started: {recordingState.started.toString()}</h3>
            <h3>recordings: {JSON.stringify(recordings)}</h3>
          </div>
        </div>
      </div>
      </HuddleClientProvider>
    </div>
  );
};

export default HuddleClient;
