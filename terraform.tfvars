/*
monitoring_alert_policy = {
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
        display_name = "Terraform-policy-3"
        combiner = "OR"
        condition_display_name = "Terraform-condition-1"
        filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration       = "120s"
        comparison       = "COMPARISON_GT"
        alignment_period   = "120s"
        per_series_aligner       = "ALIGN_RATE"
    }
  }
*/
monitoring_alert_policy = {
  "telecom-interconnect-network-alertpolicy" = {
          display_name = "telecom-interconnect-alertpolicy"
          combiner = "OR"
          condition_display_name = "Interconnect Attachment - Network Capacity"
          filter = "resource.type = \"interconnect_attachment\" AND resource.labels.project_id = \"cnr-hub-svpc\" AND metric.type = \"interconnect.googleapis.com/network/attachment/capacity\""
          threshold_value = "157286400"
          duration   = "60s"
          comparison = "COMPARISON_GT"
          alignment_period   = "300s"
          per_series_aligner = "ALIGN_MEAN"
          trigger_count= "1"
          percent = "0"
          severity = "critical"
          resource_type = "gce_instance"

      }
    "telecom-interconnect-egress-alertpolicy" = {
          display_name = ""
          combiner = "OR"
          condition_display_name = "Interconnect Attachment - Egress bytes from Interconnect Attachment"
          filter = "resource.type = \"interconnect_attachment\" AND resource.labels.project_id = \"cnr-hub-svpc\" AND metric.type = \"networking.googleapis.com/interconnect_attachment/egress_bytes_count\""
          threshold_value = "104857600"
          duration   = "60s"
          comparison = "COMPARISON_GT"
          alignment_period    = "900s"
          cross_series_reducer= "REDUCE_NONE"
          per_series_aligner  = "ALIGN_RATE"
          trigger_count= "1"
          severity = "critical"
          resource_type = "gce_instance"

      }  

}
