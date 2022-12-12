package quote

import (
	"appostrof_api/pkg/logging"
	"encoding/json"
	"fmt"
	"github.com/julienschmidt/httprouter"
	"net/http"
)

type Handler struct {
	logger *logging.Logger
}

func (h *Handler) Register(router *httprouter.Router) {
	router.HandlerFunc(http.MethodGet, "/quote", h.GetQuote)
}

// GetQuote
// @Summary Returns random quote (dev version)
// @Tags Quote
// @Success 200
// @Failure 400
// @Router /quote [get]
func (h *Handler) GetQuote(w http.ResponseWriter, _ *http.Request) {
	type GetQuoteDto struct {
		UserID  string `json:"userID"`
		StoryID string `json:"storyID"`
		Text    string `json:"text"`
	}
	m := GetQuoteDto{
		UserID:  "example user id",
		StoryID: "example story id",
		Text:    "Ясос Биб родился 17 января 1876 года в Испании.",
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)
	err := json.NewEncoder(w).Encode(m)
	if err != nil {
		fmt.Println(err)
	}
}
