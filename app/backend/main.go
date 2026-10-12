package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Response struct {
	Status string `json:"status"`
	Message string `json:"message"`
}

func main() {
	http.HandleFunc("/api/data", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.Header().Set("Access-Control-Allow-Origin", "*")
		json.NewEncoder(w).Encode(Response{Status: "success", 
		Message: "Hello from the backend microservice!"})
	})
	log.Fatal(http.ListenAndServe(":8080", nil))
}
