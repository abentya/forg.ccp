# forg.ccp
#include <iostream>
#include <chrono>
#include <thread>
#include <string>
#include <ctime>
#include <windows.h>

void setAlarm() {
    std::string alarmTime;
    std::cout << "Установите время будильника (в формате ЧЧ:ММ): ";
    std::cin >> alarmTime;

    while (true) {
        time_t now = time(0);
        tm* currentTime = localtime(&now);
        char current[6];
        strftime(current, sizeof(current), "%H:%M", currentTime);

        if (alarmTime == current) {
            playAlarm();
            break;
        }
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

void playAlarm() {
    Beep(2500, 1000);
    std::cout << "Проснитесь! Уже время!" << std::endl;
}

int main() {
    setAlarm();
    return 0;
}
