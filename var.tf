variable "monitoring_alert_policy" {
  type = map(object({
    display_name = string
    combiner = string
    condition_display_name = string
    filter = string
    duration = string
    comparison = string
    alignment_period = string
    per_series_aligner =    string
    severity = string
    resource_type = string
  }))
  default = {}
}

variable "lables" {
  type = map(object({
      severity = string
      resource_type = string
    }))

  default = {}
  }
