policies = [
  {
    display_name = "Alert policy"
    combiner     = "OR"

    conditions = {
      display_name = "test condition"
      condition_threshold = {
        filter     = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration   = "60s"
        comparison = "COMPARISON_GT"
        aggregations = {
          alignment_period   = "60s"
          per_series_aligner = "ALIGN_RATE"
        }
      }
    }

    user_labels = {
      environment = "examples"
    }
    documentation = {
  content = "telecom-interconnect-alert | P1 | DC Traffic Check"
}
  },
  {
    display_name = "Alert policy1"
    combiner     = "OR"


    conditions = {
      display_name = "test condition1"
      condition_absent = {
        filter     = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration   = "600s"
        comparison = "COMPARISON_GT"
        aggregations = {
          alignment_period   = "60s"
          per_series_aligner = "ALIGN_RATE"
        }
        trigger = {
          percent = 50
        }
      }
    }

    user_labels = {
      environment1 = "examples1"
    }
  },
  {
    display_name = "Alert policy50"
    combiner     = "OR"


    conditions = {
      display_name = "test condition50"
      condition_threshold = {
        filter     = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration   = "600s"
        comparison = "COMPARISON_GT"
        aggregations = {
          alignment_period   = "60s"
          per_series_aligner = "ALIGN_RATE"
        }
        trigger = {
          count = 1
        }
      }
    }

    user_labels = {
      environment1 = "examples1"
    }
   documentation = {
  content = "VM-interconnect-alert | P1 | AC Traffic Check"
}
  }
]
