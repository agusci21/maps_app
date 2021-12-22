part of 'location_bloc.dart';

class LocationState extends Equatable {

  final bool isFollowingUser;
  //TODO Ultima geolocation conocido

  const LocationState({this.isFollowingUser = false});
  
  @override
  List<Object> get props => [isFollowingUser];
}


