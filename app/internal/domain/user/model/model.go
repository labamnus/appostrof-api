package model

type User struct {
	Id       string `json:"id"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	Password string `json:"password"`
	ImageId  string `json:"image_id"`
	IsAdmin  bool   `json:"is_admin"`
}
