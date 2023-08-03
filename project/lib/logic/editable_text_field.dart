import 'package:project/packages.dart';

class EditableTextField extends StatefulWidget {
  const EditableTextField(
      {Key? key, this.initialText, this.onSubmitted, this.editable = true})
      : super(key: key);

  final String? initialText;
  final void Function(String)? onSubmitted;
  final bool editable;

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool _isEditing = false;
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editingController.text = widget.initialText ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return _isEditing ? _editingMode() : _nonEditingMode();
  }

  Widget _editingMode() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            controller: _editingController,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _isEditing = false;
              if (widget.onSubmitted != null) {
                widget.onSubmitted!(_editingController.text);
              }
            });
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }

  Widget _nonEditingMode() {
    return Row(
      children: [
        Expanded(
          child: Text(
            _editingController.text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        if (widget.editable)
          IconButton(
            onPressed: () {
              if (widget.editable) {
                setState(() {
                  _isEditing = true;
                });
              }
            },
            icon: const Icon(Icons.edit),
          ),
      ],
    );
  }
}
