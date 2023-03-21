module TurboStreams::AnalyticsHelper
  def analytics(event)
    turbo_stream_action_tag :analytics, event: event
  end
end
Turbo::Streams::TagBuilder.prepend(TurboStreams::AnalyticsHelper)

