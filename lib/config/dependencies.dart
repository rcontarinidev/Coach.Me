// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/auth_repository.dart';
import '../data/auth_repository_dev.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [
/*  Provider(
    lazy: true,
    create: (context) => BookingCreateUseCase(
      destinationRepository: context.read(),
      activityRepository: context.read(),
      bookingRepository: context.read(),
    ),
  ),
  Provider(
    lazy: true,
    create: (context) => BookingShareUseCase.withSharePlus(),
  ),*/
];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> get providersRemote {
  return [
    /*Provider(
      create: (context) => AuthApiClient(),
    ),
    Provider(
      create: (context) => ApiClient(),
    ),
    Provider(
      create: (context) => SharedPreferencesService(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryRemote(
        authApiClient: context.read(),
        apiClient: context.read(),
        sharedPreferencesService: context.read(),
      ) as AuthRepository,
    ),
    Provider(
      create: (context) => DestinationRepositoryRemote(
        apiClient: context.read(),
      ) as DestinationRepository,
    ),
    Provider(
      create: (context) => ContinentRepositoryRemote(
        apiClient: context.read(),
      ) as ContinentRepository,
    ),
    Provider(
      create: (context) => ActivityRepositoryRemote(
        apiClient: context.read(),
      ) as ActivityRepository,
    ),
    Provider.value(
      value: ItineraryConfigRepositoryMemory() as ItineraryConfigRepository,
    ),
    Provider(
      create: (context) => BookingRepositoryRemote(
        apiClient: context.read(),
      ) as BookingRepository,
    ),
    Provider(
      create: (context) => UserRepositoryRemote(
        apiClient: context.read(),
      ) as UserRepository,
    ),
    ..._sharedProviders,*/
  ];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
/// The user is always logged in.
List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider.value(
      value: AuthRepositoryDev() as AuthRepository,
    ),
    /*Provider.value(
      value: LocalDataService(),
    ),
    Provider(
      create: (context) => DestinationRepositoryLocal(
        localDataService: context.read(),
      ) as DestinationRepository,
    ),
    Provider(
      create: (context) => ContinentRepositoryLocal(
        localDataService: context.read(),
      ) as ContinentRepository,
    ),
    Provider(
      create: (context) => ActivityRepositoryLocal(
        localDataService: context.read(),
      ) as ActivityRepository,
    ),
    Provider(
      create: (context) => BookingRepositoryLocal(
        localDataService: context.read(),
      ) as BookingRepository,
    ),
    Provider.value(
      value: ItineraryConfigRepositoryMemory() as ItineraryConfigRepository,
    ),
    Provider(
      create: (context) => UserRepositoryLocal(
        localDataService: context.read(),
      ) as UserRepository,
    ),*/
    ..._sharedProviders,
  ];
}
