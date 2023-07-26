variable "version" {
  default = ""
}

variable "repo" {
  default = "chinayin/debian"
}

group "default" {
  targets = ["bullseye", "bullseye-slim", "bookworm", "bookworm-slim"]
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
  context  = "bookworm"
  tags     = [
    "${repository}:latest",
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
target "buster" {
  inherits = ["_all_platforms"]
  context  = "buster"
  tags     = [
    "${repository}:buster",
    "${repository}:10",
  ]
}
target "buster-slim" {
  inherits = ["_all_platforms"]
  context  = "buster"
  tags     = [
    "${repository}:buster-slim",
    "${repository}:10-slim",
  ]
}
