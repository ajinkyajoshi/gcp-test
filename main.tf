locals {
  policies = [
    for policy in var.policies : {
      display_name = policy.display_name
      combiner     = policy.combiner
      conditions   = policy.conditions
      #enabled               = lookup(policy, "enabled", true)
      #notification_channels = lookup(policy, "notification_channels", [])
      user_labels = lookup(policy, "user_labels", null)
      #documentation         = lookup(policy, "documentation", null)
    }
  ]
}



resource "google_monitoring_alert_policy" "policies" {
  for_each     = { for policy in var.policies : lower(policy.display_name) => policy }
  display_name = each.value.display_name
  project      = "xyz"
  combiner     = each.value.combiner
  #enabled               = each.value.enabled
  #notification_channels = each.value.notification_channels
  user_labels = each.value.user_labels


  conditions {
    display_name = each.value.conditions.display_name
    name         = lookup(each.value, "name", null)

    dynamic "condition_threshold" {
      for_each = lookup(each.value.conditions, "condition_threshold", null) == null ? [] : [each.value.conditions.condition_threshold]
      content {
        duration           = lookup(condition_threshold.value, "duration", null)
        comparison         = lookup(condition_threshold.value, "comparison", null)
        threshold_value    = lookup(condition_threshold.value, "threshold_value", null)
        denominator_filter = lookup(condition_threshold.value, "denominator_filter", null)
        filter             = lookup(condition_threshold.value, "filter", null)

        dynamic "aggregations" {
          for_each = lookup(condition_threshold.value, "aggregations", null) == null ? [] : [condition_threshold.value.aggregations]
          content {
            per_series_aligner   = lookup(aggregations.value, "per_series_aligner", null)
            group_by_fields      = lookup(aggregations.value, "group_by_fields", [])
            alignment_period     = lookup(aggregations.value, "alignment_period", null)
            cross_series_reducer = lookup(aggregations.value, "cross_series_reducer", null)
          }
        }
        dynamic "trigger" {
          for_each = lookup(condition_threshold.value, "trigger", null) == null ? [] : [condition_threshold.value.trigger]
          content {
            percent = lookup(trigger.value, "percent", null)
            count   = lookup(trigger.value, "count", null)
          }
        }
      }
    }



    dynamic "condition_absent" {
      for_each = lookup(each.value.conditions, "condition_absent", null) == null ? [] : [each.value.conditions.condition_absent]
      content {
        duration = lookup(condition_absent.value, "duration", null)
        filter   = lookup(condition_absent.value, "filter", null)
        dynamic "aggregations" {
          for_each = lookup(condition_absent.value, "aggregations", null) == null ? [] : [condition_absent.value.aggregations]
          content {
            per_series_aligner   = lookup(aggregations.value, "per_series_aligner", null)
            group_by_fields      = lookup(aggregations.value, "group_by_fields", [])
            alignment_period     = lookup(aggregations.value, "alignment_period", null)
            cross_series_reducer = lookup(aggregations.value, "cross_series_reducer", null)
          }
        }
        dynamic "trigger" {
          for_each = lookup(condition_absent.value, "trigger", null) == null ? [] : [condition_absent.value.trigger]
          content {
            percent = lookup(trigger.value, "percent", null)
            count   = lookup(trigger.value, "count", null)
          }
        }
      }
    }
  }
}
