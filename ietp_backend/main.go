

package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/handlers"
	"github.com/sashabaranov/go-openai"
)

type ChatRequest struct {
	Messages []openai.ChatCompletionMessage `json:"messages"`
}

func chatHandler(w http.ResponseWriter, r *http.Request) {
	// API Configuration
	baseURL := "https://api.aimlapi.com/v1"
	apiKey := "##############################"

	// Decode the incoming request body
	var req ChatRequest
	err := json.NewDecoder(r.Body).Decode(&req)
	if err != nil {
		http.Error(w, "Invalid request body", http.StatusBadRequest)
		return
	}

	// Create OpenAI client with custom BaseURL
	config := openai.DefaultConfig(apiKey)
	config.BaseURL = baseURL
	client := openai.NewClientWithConfig(config)

	// Create Chat Completion Request
	chatReq := openai.ChatCompletionRequest{
		Model:       "mistralai/Mistral-7B-Instruct-v0.2",
		Messages:    req.Messages,
		Temperature: 0.7,
		MaxTokens:   256,
	}

	// Get AI Response
	resp, err := client.CreateChatCompletion(context.Background(), chatReq)
	if err != nil {
		http.Error(w, "Error from OpenAI API", http.StatusInternalServerError)
		return
	}

	// Respond with AI response
	response := map[string]interface{}{
		"user_message": req.Messages[len(req.Messages)-1].Content,
		"ai_response":  resp.Choices[0].Message.Content,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func main() {
	// Your existing handler
	http.HandleFunc("/chat", chatHandler)

	// Define the port
	port := "8080"
	fmt.Printf("Server started at http://localhost:%s\n", port)

	// Set up CORS and start the server
	// This will allow all origins to access the server
	cors := handlers.CORS(
		handlers.AllowedOrigins([]string{"*"}),                             // Allow all origins
		handlers.AllowedMethods([]string{"GET", "POST", "PUT", "DELETE"}),  // Allow specific HTTP methods
		handlers.AllowedHeaders([]string{"Content-Type", "Authorization"}), // Allow specific headers
	)

	// Start the server with CORS enabled
	log.Fatal(http.ListenAndServe(":"+port, cors(http.DefaultServeMux)))
}
