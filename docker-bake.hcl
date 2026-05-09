variable "version" {
  default = ""
}

variable "repo" {
  default = "chinayin/debian"
}

group "default" {
  targets = ["trixie", "trixie-slim", "bookworm", "bookworm-slim", "bullseye", "bullseye-slim"]
}

function "platforms" {
  params = []
  result = ["linux/amd64", "linux/arm64"]
}

variable "registry" {
  default = "docker.io"
}

variable "repository" {
  default = "${registry}/${repo}"
}

target "_all_platforms" {
  platforms = platforms()
}

target "trixie" {
  inherits = ["_all_platforms"]
  context  = "trixie"
  tags     = [
    "${repository}:trixie",
    "${repository}:13",
  ]
}
target "trixie-slim" {
  inherits = ["_all_platforms"]
  context  = "trixie-slim"
  tags     = [
    "${repository}:latest",
    "${repository}:trixie-slim",
    "${repository}:13-slim",
  ]
}
target "bookworm" {
  inherits = ["_all_platforms"]
  context  = "bookworm"
  tags     = [
    "${repository}:bookworm",
    "${repository}:12",
  ]
}
target "bookworm-slim" {
  inherits = ["_all_platforms"]
  context  = "bookworm-slim"
  tags     = [
    "${repository}:bookworm-slim",
    "${repository}:12-slim",
  ]
}
target "bullseye" {
  inherits = ["_all_platforms"]
  context  = "bullseye"
  tags     = [
    "${repository}:bullseye",
    "${repository}:11",
  ]
}
target "bullseye-slim" {
  inherits = ["_all_platforms"]
  context  = "bullseye-slim"
  tags     = [
    "${repository}:bullseye-slim",
    "${repository}:11-slim",
  ]
}
