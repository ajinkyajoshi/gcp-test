/*variable "monitoring_alert_policy" {
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
*/
  
#Added for alerting policy
variable "monitoring_alert_policy" {
  type = map(object({
    display_name = string #Name of the alert policy
    combiner = string
    condition_display_name = string #Name of Metric Condition 
    filter = string
    duration = string
    comparison = string
    alignment_period = string
    per_series_aligner =    string
    cross_series_reducer = string
    trigger_count = string
    percent = string
    severity = string
    resource_type = string
  }))
  default = {}
}
