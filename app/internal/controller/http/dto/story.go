package dto

type GetStoryDto struct {
	ID          string         `json:"ID"`
	Title       string         `json:"title"`
	Description string         `json:"description"`
	Cover       string         `json:"cover"`
	LinkToText  string         `json:"linkToText"`
	TimeToRead  int            `json:"timeToRead"`
	Tags        map[int]string `json:"tags"`
	Rating      float64        `json:"rating"`
}
