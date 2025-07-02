import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:experiment_sdk_flutter/types/experiment_exposure_tracking_provider.dart';
import 'package:experiment_sdk_flutter/types/experiment_variant.dart';

class AnalyticsExposureTrackingProvider
    implements ExperimentExposureTrackingProvider {
  @override
  Future<void> exposure(
    String flagKey,
    ExperimentVariant? variant,
    String instanceName,
  ) async {
    final properties = {'variant': variant?.value, 'flag_key': flagKey};

    if (variant == null) {
      properties.remove('variant');
    }

    final amplitude = Amplitude(Configuration(apiKey: instanceName));
    await amplitude.track(BaseEvent("\$exposure", eventProperties: properties));
  }
}
