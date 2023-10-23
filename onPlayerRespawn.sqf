//Sets voice of player to have no custom voice on respawn
waitUntil {alive player};

[] spawn {
    _voice = speaker player;
    player setSpeaker "NoVoice";
    sleep 5;
    player setSpeaker _voice;
};

//Remove // (slash) or uncomment the code below for incremental respawn timer
// respawnTimer = respawnTimer + 5;
// publicVariable "respawnTimer";
// respawnTimer remoteExec ["setPlayerRespawnTime", 0];