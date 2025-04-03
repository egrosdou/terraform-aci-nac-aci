resource "aci_rest_managed" "fabricHIfPol" {
  dn         = "uni/infra/hintfpol-${var.name}"
  class_name = "fabricHIfPol"
  content = {
    name             = var.name
    speed            = var.speed
    link_delay_ms    = var.link_delay_ms
    link_debounce_ms = var.link_debounce_ms
    autoNeg          = var.auto == true ? "on" : "off"
    fecMode          = var.fec_mode
    portPhyMediaType = try(var.physical_media_type, null) != null ? var.physical_media_type : null
  }
}

