from flask import Flask, request, jsonify
import uuid

app = Flask(__name__)
app.secret_key = 'tourism_expert_system_secret_key'

# Dictionary to store the decision tree structure
decision_tree = {
    "start": {
        "question": "Do you prefer indoor or outdoor activities?",
        "options": ["inside", "outside"],
        "next_fact": "location"
    },
    "location_inside": {
        "question": "Do you like nature?",
        "options": ["yes", "no"],
        "next_fact": "nature_inside"
    },
    "location_outside": {
        "question": "Do you like nature?",
        "options": ["yes", "no"],
        "next_fact": "nature_outside"
    },
    "nature_inside_yes": {
        "question": "Do you like mountains?",
        "options": ["yes", "no"],
        "next_fact": "mountain_inside"
    },
    "nature_inside_no": {
        "question": "Do you like historical places?",
        "options": ["yes", "no"],
        "next_fact": "history_inside"
    },
    "mountain_inside_yes": {
        "result": "Visit Zabadani or Bloudan."
    },
    "mountain_inside_no": {
        "question": "Do you like water activities?",
        "options": ["yes", "no"],
        "next_fact": "water_inside"
    },
    "water_inside_yes": {
        "result": "Visit Cham City Center."
    },
    "water_inside_no": {
        "result": "Visit Dummar Project."
    },
    "history_inside_yes": {
        "question": "Do you like museums?",
        "options": ["yes", "no"],
        "next_fact": "museums"
    },
    "history_inside_no": {
        "question": "Do you like shopping?",
        "options": ["yes", "no"],
        "next_fact": "shopping"
    },
    "museums_yes": {
        "result": "Visit the National Museum."
    },
    "museums_no": {
        "question": "Do you like old markets?",
        "options": ["yes", "no"],
        "next_fact": "markets"
    },
    "markets_yes": {
        "result": "Visit Al-Hamidiyah Souq."
    },
    "markets_no": {
        "result": "Visit the Umayyad Mosque."
    },
    "shopping_yes": {
        "result": "Visit Damascus Boulevard."
    },
    "shopping_no": {
        "result": "Visit restaurants in Damascus."
    },
    "nature_outside_yes": {
        "question": "Do you like mountains?",
        "options": ["yes", "no"],
        "next_fact": "mountain_outside"
    },
    "nature_outside_no": {
        "question": "Do you like historical places?",
        "options": ["yes", "no"],
        "next_fact": "history_outside"
    },
    "mountain_outside_yes": {
        "question": "Do you like walking?",
        "options": ["yes", "no"],
        "next_fact": "walking_outside"
    },
    "walking_outside_yes": {
        "result": "Walk in the mountains of Qasab."
    },
    "walking_outside_no": {
        "result": "Relax at a hotel in Kasab."
    },
    "mountain_outside_no": {
        "question": "Do you like the sea?",
        "options": ["yes", "no"],
        "next_fact": "sea_nature"
    },
    "sea_nature_yes": {
        "question": "Do you like lakes?",
        "options": ["yes", "no"],
        "next_fact": "lakes"
    },
    "lakes_yes": {
        "result": "Visit the Seven Lakes."
    },
    "lakes_no": {
        "result": "Visit Latakia or Tartous."
    },
    "sea_nature_no": {
        "result": "Try the zipline at Tartous huts."
    },
    "history_outside_yes": {
        "question": "Would you like to visit Homs?",
        "options": ["yes", "no"],
        "next_fact": "homs"
    },
    "history_outside_no": {
        "result": "You can visit public gardens and parks."
    },
    "homs_yes": {
        "result": "Visit the Citadel of Homs."
    },
    "homs_no": {
        "question": "Would you like to visit Aleppo?",
        "options": ["yes", "no"],
        "next_fact": "aleppo"
    },
    "aleppo_yes": {
        "result": "Visit the Citadel of Aleppo."
    },
    "aleppo_no": {
        "question": "Would you like to visit Palmyra or Bosra?",
        "options": ["yes", "no"],
        "next_fact": "palmyra_bosra"
    },
    "palmyra_bosra_yes": {
        "result": "Visit Palmyra or Bosra."
    },
    "palmyra_bosra_no": {
        "result": "Visit the Church of Our Lady."
    }
}

# Session storage for user interactions
sessions = {}

@app.route('/api/tourism/start', methods=['GET'])
def start_session():
    session_id = str(uuid.uuid4())
    sessions[session_id] = {
        "facts": {},
        "current_node": "start"
    }
    
    return jsonify({
        "session_id": session_id,
        "question": decision_tree["start"]["question"],
        "options": decision_tree["start"]["options"],
        "next_fact": decision_tree["start"]["next_fact"],
        "is_final": False
    })

@app.route('/api/tourism/answer', methods=['POST'])
def process_answer():
    data = request.json
    session_id = data.get('session_id')
    fact_name = data.get('fact_name')
    fact_value = data.get('fact_value')
    
    if session_id not in sessions:
        return jsonify({"error": "Invalid session ID"}), 400
    
    session_data = sessions[session_id]
    session_data["facts"][fact_name] = fact_value
    
    if fact_name == "location":
        next_node = f"location_{fact_value}"
    else:
        next_node = f"{fact_name}_{fact_value}"
    
    session_data["current_node"] = next_node
    
    if "result" in decision_tree.get(next_node, {}):
        result = decision_tree[next_node]["result"]
        return jsonify({
            "result": result,
            "is_final": True
        })
    
    if "question" in decision_tree.get(next_node, {}):
        next_question = decision_tree[next_node]["question"]
        options = decision_tree[next_node]["options"]
        return jsonify({
            "question": next_question,
            "options": options,
            "next_fact": decision_tree[next_node]["next_fact"],
            "is_final": False
        })
    
    return jsonify({"error": "Unexpected state"}), 500

@app.route('/api/tourism/reset', methods=['POST'])
def reset_session():
    data = request.json
    session_id = data.get('session_id')
    
    if session_id in sessions:
        del sessions[session_id]
    
    return jsonify({"status": "session reset"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)