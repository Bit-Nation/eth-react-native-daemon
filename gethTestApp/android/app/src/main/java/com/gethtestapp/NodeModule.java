package com.gethtestapp;

import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import org.ethereum.geth.Geth;
import org.ethereum.geth.Node;
import org.ethereum.geth.NodeConfig;

import java.io.File;

/**
 * Created by Estarrona on 15/12/17.
 */

public class NodeModule extends ReactContextBaseJavaModule {

    private Node node;
    final String TAG = "GethNode";

    public NodeModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "NodeModule";
    }

    @ReactMethod
    public void startDaemon() {
        Log.d("GethNode", "Starting Geth process" );

        NodeConfig nodeConfig = Geth.newNodeConfig();
        Log.d("GethNode", "New node" );
        nodeConfig.setEthereumDatabaseCache(16);
        nodeConfig.setEthereumEnabled(true);
        nodeConfig.setEthereumNetworkID(3);
        String genesis = Geth.testnetGenesis();
        nodeConfig.setEthereumGenesis(genesis);
        nodeConfig.setMaxPeers(25);
        nodeConfig.setWhisperEnabled(false);

        Log.d("GethNode", "Configured" );

        final String root = getReactApplicationContext().getBaseContext().getApplicationInfo().dataDir;
        final String dataFolder = root + "/.ethereum";
        Log.d("GethNode", "Starting Geth node in folder: " + dataFolder);

        Log.d("GethNode", "Have the root/folder" );

        try {
            final File newFile = new File(dataFolder);
            newFile.mkdir();
        } catch (Exception e) {
            Log.e(TAG, "error making folder: " + dataFolder, e);
        }

        final String networkDir = dataFolder + "/$TMPDIR";

        node = new Node(networkDir, nodeConfig);
        Log.d(TAG, "Node config " + nodeConfig);

        try {
            node.start();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Log.d(TAG, "Geth node started");
    }

    @ReactMethod
    public void stopDaemon() {
        try {
            node.stop();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Log.d(TAG, "Geth node stoped");
    }

}
