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


  }))
  default = {
      "alert_policy" = {
        display_name = "Terraform-policy-1"
        combiner = "OR"
        condition_display_name = "Terraform-condition-1"
        filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration       = "60s"
        comparison       = "COMPARISON_GT"
        alignment_period   = "60s"
        per_series_aligner       = "ALIGN_RATE"
    }
      "alert_policy1" = {
        display_name = "Terraform-policy-2"
        combiner = "OR"
        condition_display_name = "Terraform-condition-1"
        filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration       = "120s"
        comparison       = "COMPARISON_GT"
        alignment_period   = "120s"
        per_series_aligner       = "ALIGN_RATE"
    }    
  }
}
*/
  
variable "monitoring_alert_policy" {
  type = map(object({
    display_name = string  
    combiner = string
    condition_display_name = string
    filter = string
    filter1 = string
    filter2 = string
    duration = string
    comparison = string
    alignment_period = string
    per_series_aligner =    string
 }))

  default = {}
}
  variable "lables" {
  type = map(object({
      severity = string
      resource = string
    }))
 
  default = {}
  }
