

from flask import Flask, request, jsonify
import hashlib
import time
import json

app = Flask(__name__)

def hashgenerator(data):
    return hashlib.sha256(data.encode()).hexdigest()

class Block:
    def __init__(self, data, hash, prev_hash, timestamp=None):
        self.data = data
        self.hash = hash
        self.prev_hash = prev_hash
        self.timestamp = timestamp or time.time()

class BlockChain:
    def __init__(self):
        hashlast = hashgenerator("gen_last")
        hashstart = hashgenerator("gen_start")
        genesis = Block("Genesis Block", hashstart, hashlast)
        self.chain = [genesis]

    def add_block(self, data):
        prev_hash = self.chain[-1].hash
        block_hash = hashgenerator(json.dumps(data, sort_keys=True) + prev_hash)
        new_block = Block(data, block_hash, prev_hash)
        self.chain.append(new_block)
        return new_block  

# Initialize blockchain
blockchain = BlockChain()



@app.route('/add_block', methods=['POST'])
def add_block():
    data = request.get_json()

    if not data:
        return jsonify({"error": "No data provided"}), 400

    # Create block
    block = blockchain.add_block(data)
    block_hash = block.hash  # Or however you calculate hash in your class

    return jsonify({
        "message": "Block added successfully",
        "BID": block_hash  # <-- return the unique ID
    }), 200


@app.route('/get_chain', methods=['GET'])
def get_chain():
    chain_data = [
        {
            "data": block.data,
            "hash": block.hash,
            "prev_hash": block.prev_hash,
            "timestamp": block.timestamp
        } for block in blockchain.chain
    ]
    return jsonify({"chain": chain_data}), 200


if __name__ == '__main__':
    app.run(debug=True)
