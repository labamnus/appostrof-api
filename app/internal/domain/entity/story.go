package entity

type Story struct {
	ID          string         `json:"id"`
	Authors     []Author       `json:"authors"`
	Title       string         `json:"title"`
	Description string         `json:"description"`
	Cover       string         `json:"cover"`
	LinkToText  string         `json:"linkToText"`
	TimeToRead  float64        `json:"timeToRead"`
	Tags        map[int]string `json:"tags"`
	Rating      float64        `json:"rating"`
}
