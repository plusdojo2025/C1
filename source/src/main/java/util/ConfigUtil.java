package util;

import java.io.InputStream;
import java.util.Properties;

public class ConfigUtil {
    private static final Properties props = new Properties();

    static {
        try (InputStream in = ConfigUtil.class.getClassLoader().getResourceAsStream("/config.properties")) {
            props.load(in);
        } catch (Exception e) {
            throw new RuntimeException("プロパティファイルの読み込みに失敗しました", e);
        }
    }

    public static String getPepper() {
        return props.getProperty("pepper");
    }
}