import { Dispatch, useState } from "react";

type themeType = "light" | "dark";

export default function useDarkMode(): [themeType, Dispatch<void>] {
  const [theme, setTheme] = useState<themeType>(
    typeof window !== "undefined" ? localStorage.theme ?? "light" : "dark"
  );

  const switchTheme = () => {
    const newTheme = theme === "light" ? "dark" : "light";

    localStorage.setItem("theme", newTheme);
    setTheme(newTheme);
  };

  return [theme, switchTheme];
}
