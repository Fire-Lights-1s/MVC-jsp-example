package com.oreilly.servlet.multipart;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import jakarta.servlet.ServletInputStream;

public class ParamPart extends Part {
   private byte[] value;
   private String encoding;

   ParamPart(String name, ServletInputStream in, String boundary, String encoding) throws IOException {
      super(name);
      this.encoding = encoding;
      PartInputStream pis = new PartInputStream(in, boundary);
      ByteArrayOutputStream baos = new ByteArrayOutputStream(512);
      byte[] buf = new byte[128];

      int read;
      while((read = pis.read(buf)) != -1) {
         baos.write(buf, 0, read);
      }

      pis.close();
      baos.close();
      this.value = baos.toByteArray();
   }

   public byte[] getValue() {
      return this.value;
   }

   public String getStringValue() throws UnsupportedEncodingException {
      return this.getStringValue(this.encoding);
   }

   public String getStringValue(String encoding) throws UnsupportedEncodingException {
      return new String(this.value, encoding);
   }

   public boolean isParam() {
      return true;
   }
}
