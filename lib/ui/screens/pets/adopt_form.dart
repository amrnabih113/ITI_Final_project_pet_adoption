import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/models/adoption_requist.dart';
import 'package:pet_adoption/models/appointment_model.dart';
import 'package:pet_adoption/models/pets_model.dart';

class AdoptionProcessPage extends StatefulWidget {
  final PetsModel pet;

  const AdoptionProcessPage({super.key, required this.pet});

  @override
  State<AdoptionProcessPage> createState() => _AdoptionProcessPageState();
}

class _AdoptionProcessPageState extends State<AdoptionProcessPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 60)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MyColors.primaryColor, // calendar header & buttons
              onPrimary: Colors.white,
              onSurface: MyColors.textPrimary,
              shadow: MyColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              dialHandColor: MyColors.primaryColor,
              hourMinuteTextColor: MyColors.primaryColor,
              dayPeriodColor: MyColors.primaryColor.withValues(alpha: 0.1),
              dialBackgroundColor: MyColors.primaryColor.withValues(alpha: 0.1),
              timeSelectorSeparatorColor: WidgetStatePropertyAll(
                MyColors.primaryColor.withValues(alpha: 0.1),
              ),
              entryModeIconColor: MyColors.primaryColor,
              cancelButtonStyle: TextButton.styleFrom(
                foregroundColor: MyColors.error,
              ),

              hourMinuteColor: MyColors.primaryColor.withValues(alpha: 0.1),
              hourMinuteShape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              dayPeriodShape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: MyColors.light,
              confirmButtonStyle: TextButton.styleFrom(
                foregroundColor: MyColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  void _submitAdoption() {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select date and time")),
      );
      return;
    }

    if (_nameController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields")),
      );
      return;
    }

    final appointmentDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final adoptionRequest = AdoptionRequist(
      petId: widget.pet.id,
      userId: "currentUserId", // Replace with actual logged-in user ID
      status: "pending",
      adoptedAt: DateTime.now(),
    );

    final appointment = Appointment(
      petId: widget.pet.id,
      userId: "currentUserId",
      appointmentDateTime: appointmentDateTime,
      notes: _notesController.text.trim(),
    );

    // TODO: Send adoptionRequest & appointment to backend
    print(adoptionRequest.toJson());
    print(appointment.toJson());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Adoption request & appointment sent")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = _selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
        : "Select Date";

    final timeStr = _selectedTime != null
        ? _selectedTime!.format(context)
        : "Select Time";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Adopt ${widget.pet.name}")],
        ),
        centerTitle: true,
        shape: const UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(color: MyColors.primaryColor),
        toolbarHeight: 70,

        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet Summary
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.pet.images.isNotEmpty
                    ? widget.pet.images.first
                    : "https://via.placeholder.com/400x300",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.pet.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              "${widget.pet.breed} • ${widget.pet.age} years old",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(widget.pet.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),

            // Date & Time Pickers
            const Text(
              "Choose Appointment Date & Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(dateStr),
                    onPressed: _pickDate,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.access_time),
                    label: Text(timeStr),
                    onPressed: _pickTime,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // User Info Fields
            const Text(
              "Your Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Full Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: "Phone Number"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: "Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                hintText: "Additional Notes (optional)",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitAdoption,

                child: Text(
                  "Confirm Appointment",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
