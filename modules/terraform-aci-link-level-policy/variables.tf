variable "name" {
  description = "Link level interface policy name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.:-]{0,64}$", var.name))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `:`, `-`. Maximum characters: 64."
  }
}

variable "link_delay_ms" {
  description = "Link delay. Default value is set to 10ms"
  type        = number
  default     = 10

  validation {
    condition     = var.link_delay_ms > 10
    error_message = "The link delay should be at least 10ms"
  }
}

variable "link_debounce_ms" {
  description = "Link debounce. Default value is set to 110ms"
  type        = number
  default     = 110

  validation {
    condition     = var.link_debounce_ms > 110
    error_message = "The link debounce should be at least 110ms"
  }
}

variable "speed" {
  description = "Interface speed. Choices: `inherit`, `auto`, `100M`, `1G`, `10G`, `25G`, `40G`, `100G`, `400G`."
  type        = string
  default     = "inherit"

  validation {
    condition     = contains(["inherit", "auto", "100M", "1G", "10G", "25G", "40G", "100G", "400G"], var.speed)
    error_message = "Allowed values: `inherit`, `auto`, `100M`, `1G`, `10G`, `25G`, `40G`, `100G` or `400G`."
  }
}

variable "auto" {
  description = "Auto negotiation."
  type        = bool
  default     = true
}

variable "fec_mode" {
  description = "Forward error correction (FEC) mode. Choices: `inherit`, `cl91-rs-fec`, `cl74-fc-fec`, `ieee-rs-fec`, `cons16-rs-fec`, `disable-fec`, `auto-fec`."
  type        = string
  default     = "inherit"

  validation {
    condition     = contains(["inherit", "cl91-rs-fec", "cl74-fc-fec", "ieee-rs-fec", "cons16-rs-fec", "disable-fec", "auto-fec"], var.fec_mode)
    error_message = "Allowed values: `inherit`, `cl91-rs-fec`, `cl74-fc-fec`, `ieee-rs-fec`, `cons16-rs-fec`, `disable-fec`, `auto-fec`."
  }
}

variable "physical_media_type" {
  description = "Physical Media Type. Choices: `auto`, `sfp-10g-tx`."
  type        = string
  default     = null

  validation {
    condition     = var.physical_media_type == null ? true : (contains(["auto", "sfp-10g-tx"], var.physical_media_type))
    error_message = "Allowed values: `auto`, `sfp-10g-tx`."
  }
}
