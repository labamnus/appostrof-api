package story

import (
	"appostrof_api/internal/controller/http/dto"
	"encoding/json"
	"fmt"
	"github.com/julienschmidt/httprouter"
	"net/http"
)

type Handler struct {
}

func (h *Handler) Register(router *httprouter.Router) {
	router.HandlerFunc(http.MethodGet, "/story", h.GetStory)
	router.HandlerFunc(http.MethodPost, "/story/rate", h.RateStory)
	router.HandlerFunc(http.MethodPost, "/story/read", h.ReadStory)
}

// GetStory
// @Summary Returns story for today
// @Tags Story
// @Success 200
// @Failure 400
// @Router /story [get]
func (h *Handler) GetStory(w http.ResponseWriter, _ *http.Request) {
	m := dto.GetStoryDto{
		ID:          "example id",
		Title:       "Биография Ясоса Биба",
		Description: "История рождения знаменитого философа",
		Cover:       "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Kvadrato.svg/langru-200px-Kvadrato.svg.png",
		LinkToText:  "Ясос Биб родился 17 января 1876 года в Испании, рос без матери, которая умерла, когда Ясосу было два года. Его отцом был испанский обувной мастер Хуасе́ Тыпидо́рас-и-Хуэ́сос (1846—1898 год), которого Ясос Биб очень любил. Также у него был родной брат по имени Дон Ягон Биб (1870—1917 год), ну или как все его называли, Ягон Дон. Дедушкой братьев был известный грузинский поэт Уймураз Могулия, бабушкой — японская гейша Атомули Ядалато, ранее работавшая у сутенёра Комухари Комусиси и изначально с сомнением относившаяся к своему будущему мужу. Незадолго до рождения ребёнка Уймураз с женой переехали в Испанию и дали сыну испанское имя, чтобы ребёнок лучше вписался в испанское общество. Но двадцать лет спустя они, затосковав по Вильнюсу, сосватали сыну литовскую девушку — Дануту Бибайте; сам же Хуасе в память о покойной жене настоял на том, чтобы сыновья носили фамилию своей матери и изучали литовский язык.\nЯсос Биб хорошо развивался. Он рано начал читать, особенно любил сказки и смешные истории. «Он читал на уроке чтения, на уроке рисования, на уроке арифметики…» — вспоминал его первый учитель Писсаро Педро Аррастиа. Впрочем, привычка читать на уроках не помешала Ясосу Бибу успешно справляться со школьной программой. Любимыми учителями Ясоса были преподаватель литературы Иаго Мочи́ла и преподавательница французского Мадам Сижу, которую школьники очень любили, несмотря на то, что она требовала от них особого прилежания и усидчивости.",
		TimeToRead:  10,
		Tags:        map[int]string{1: "гении", 2: "биография"},
		Rating:      2.2,
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(200)
	err := json.NewEncoder(w).Encode(m)
	if err != nil {
		fmt.Println(err)
	}
}

// RateStory
// @Summary Rate story
// @Param rate body float64 true "Story rate"
// @Param ID body string true "Story ID"
// @Tags Story
// @Success 200
// @Failure 400
// @Router /story/rate [post]
func (h *Handler) RateStory(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(200)
}

// ReadStory
// @Summary Read story
// @Param ID body string true "Story ID"
// @Tags Story
// @Success 200
// @Failure 400
// @Router /story/read [post]
func (h *Handler) ReadStory(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(200)
}
