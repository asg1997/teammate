import 'package:flutter/material.dart';
import 'package:teammate/domain/entities/city.dart';

class CitiesSearchTextField extends StatefulWidget {
  const CitiesSearchTextField({
    required this.items,
    required this.onChanged,
    super.key,
  });

  final List<City> items;
  final ValueChanged<City> onChanged;

  @override
  _CitiesSearchTextFieldState createState() => _CitiesSearchTextFieldState();
}

class _CitiesSearchTextFieldState extends State<CitiesSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';
  List<City> _filteredItems = [];
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String value) {
    setState(() {
      _searchText = value;
      _filteredItems = widget.items.where((city) {
        final name = city.name.toLowerCase();
        return name.startsWith(value.toLowerCase());
      }).toList();
      _removeOverlay();
      _createOverlay();
    });
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _createOverlay() {
    if (_overlayEntry != null) {
      _removeOverlay();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final overlay = Overlay.of(context);
      final box = context.findRenderObject() as RenderBox?;
      if (box == null) return;
      final offset = box.localToGlobal(Offset.zero);
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          width: box.size.width,
          top: offset.dy + box.size.height + 10,
          height: 200,
          child: _buildListView(),
        ),
      );
      overlay.insert(_overlayEntry!);
    });
  }

  Widget _buildListView() {
    return Material(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: _filteredItems.length,
        itemBuilder: (_, index) {
          final city = _filteredItems[index];
          return SizedBox(
            height: 50,
            child: ListTile(
              title: Text(city.name),
              subtitle: Text(city.region),
              tileColor: Colors.white,
              onTap: () {
                setState(() {
                  _searchText = city.name;
                  _filteredItems = widget.items;
                  _controller.text = city.name;
                  widget.onChanged(city);
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: _controller.text.length),
                  );
                  _removeOverlay();
                });
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onTap: _createOverlay,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Выберите город',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      onChanged: _onSearchTextChanged,
    );
  }
}
