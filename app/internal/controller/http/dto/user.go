package dto

type CreateUserDTO struct {
	Name      string         `json:"name"`
	Email     string         `json:"email"`
	Phone     string         `json:"phone"`
	Password  string         `json:"password"`
	Interests map[int]string `json:"interests"`
}
