package storage

import (
	"appostrof_api/pkg/client/postgresql"
	"appostrof_api/pkg/logging"
)

type storage struct {
	client postgresql.Client
	logger *logging.Logger
}
