resource "google_storage_bucket" "gcs" {
    name = "ajinkya-bhavika"
    location = "us"
}
/*
resource "google_monitoring_alert_policy" "alert_policy" {
  project = "xyz"
  for_each = var.monitoring_alert_policy
    display_name = each.value.display_name
    combiner     = each.value.combiner
    conditions {
      display_name = each.value.condition_display_name
      condition_threshold {
        filter     = each.value.filter
        duration   = each.value.duration
        comparison = each.value.comparison
        aggregations {
          alignment_period   = each.value.alignment_period
          per_series_aligner = each.value.per_series_aligner
        }
      }
    }

  user_labels = {
    foo = "bar"
  }
}

*/

/*resource "google_monitoring_alert_policy" "alert_policy" {
  project = "xyz"
  for_each = var.monitoring_alert_policy
    display_name = each.value.display_name
    combiner     = each.value.combiner
    conditions {
      display_name = each.value.condition_display_name
      condition_threshold {
        filter     = each.value.filter
        duration   = each.value.duration
        comparison = each.value.comparison
        aggregations {
          alignment_period   = each.value.alignment_period
          per_series_aligner = each.value.per_series_aligner
        }
      }
    }

 user_labels = {
     severity = each.value.severity
     resourcetype = each.value.resource_type
    }

 documentation {
  content = "telecom-interconnect-alert | P1 | DC Traffic Check"
 }
}
*/
    
resource "google_monitoring_alert_policy" "alert_policy" {
  project = "xyz"
 # notification_channels = [resource.google_monitoring_notification_channel.snow-notification.name]
  for_each = var.monitoring_alert_policy
    display_name = each.value.display_name
    combiner     = each.value.combiner
    conditions {
      display_name = each.value.condition_display_name
      condition_threshold {
        filter     = each.value.filter
        duration   = each.value.duration
        comparison = each.value.comparison
          aggregations {
           alignment_period   = each.value.alignment_period
           per_series_aligner = each.value.per_series_aligner
           cross_series_reducer=try([each.value.cross_series_reducer],[])
          }
     
            trigger {
            count = each.value.trigger_count
            percent = try([each.value.percent],[])
            }
      } 
    }
    user_labels = {
     severity = each.value.severity
     resourcetype = each.value.resource_type
    }

    documentation {
      content = "telecom-interconnect-alert | P1 | DC Traffic Check"
    }
}
