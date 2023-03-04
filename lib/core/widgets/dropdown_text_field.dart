import 'package:flutter/material.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({
    required this.cities,
    required this.onChanged,
    super.key,
  });
  final List<String> cities;
  final ValueChanged<String> onChanged;

  @override
  _CitySearchState createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final TextEditingController _controller = TextEditingController();
  bool isExpanded = false;
  String searchText = '';
  late List<String> filteredCities;

  @override
  void initState() {
    super.initState();
    filteredCities = widget.cities;
  }

  void _onSearchTextChanged(String value) {
    setState(() {
      searchText = value;
      isExpanded = true;
      filteredCities = widget.cities
          .where(
            (city) => city.toLowerCase().contains(searchText.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search for a city',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          onChanged: _onSearchTextChanged,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: isExpanded && searchText.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredCities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final city = filteredCities[index];
                    return ListTile(
                      title: Text(city),
                      onTap: () {
                        setState(() {
                          searchText = city;
                          filteredCities = widget.cities;
                          isExpanded = false;
                        });
                        _controller
                          ..text = city
                          ..selection = TextSelection.fromPosition(
                            TextPosition(offset: _controller.text.length),
                          );
                        widget.onChanged(city);
                      },
                    );
                  },
                )
              : Container(),
        ),
      ],
    );
  }
}
