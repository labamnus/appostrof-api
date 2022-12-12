package model

type Quote struct {
	Id      string `json:"id"`
	Text    string `json:"text"`
	StoryId string `json:"story_id"`
	UserId  string `json:"user_id"`
}
