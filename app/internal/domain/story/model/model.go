package model

type User struct {
	Id          string  `json:"id"`
	Title       string  `json:"title"`
	Description string  `json:"description"`
	ImageId     string  `json:"image_id"`
	Text        string  `json:"text"`
	ReadTime    uint64  `json:"read_time"`
	Rating      float64 `json:"rating"`
}
