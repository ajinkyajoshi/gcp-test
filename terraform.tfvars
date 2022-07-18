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
  "alert_policy" = {
          display_name = "Terraform-policy-1"
          combiner = "OR"
          condition_display_name = "Terraform-condition-1"
          filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
          filter1 = "resource.labels.project_id = \"cnr-hub-svpc\""
          filter2 = "resource.type=\"gce_instance\""
          duration       = "60s"
          comparison       = "COMPARISON_GT"
          alignment_period   = "60s"
          per_series_aligner       = "ALIGN_RATE"
          severity = "critical"
          resource_type = "gce_instance"

      }
        "alert_policy VM1" = {
          display_name = "Terraform-policy-VM"
          combiner = "OR"
          condition_display_name = "Terraform-condition-2"
          filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
          duration       = "120s"
          comparison       = "COMPARISON_GT"
          alignment_period   = "120s"
          per_series_aligner       = "ALIGN_RATE"
          severity = "warning"
          resource_type = "gce_instance"
      }
      "alert_policyVM2" = {
          display_name = "Terraform-policy-VM11"
          combiner = "OR"
          condition_display_name = "Terraform-condition-2"
          filter = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
          duration       = "120s"
          comparison       = "COMPARISON_GT"
          alignment_period   = "120s"
          per_series_aligner       = "ALIGN_RATE"
          severity = "error"
          resource_type = "gce_instance"
      }
  }
