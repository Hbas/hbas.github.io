
## Exercício 4.3: Let´s comment a little bit more

Quais dos comentários abaixo devem ser mantidos? Justifique sua resposta

**4.3.1:**

~~~~~~  
/** The name. */
private String name;

/** The version. */
private String version;

/** The name. */
private String licenceName;

/** The info. */
private String info;
~~~~~~

**4.3.2:**

~~~~~~
this.bytePos = writeBytes(pngIdBytes, 0);
//hdrPos = bytePos;
writeHeader();
writeResolution();
//dataPos = bytePos;
if (writeImageData()) {
    writeEnd();
    this.pngBytes = resizeByteArray(this.pngBytes, this.maxPos);
}
else {
    this.pngBytes = null;
}
return this.pngBytes;
~~~~~~

**4.3.3:**

~~~~~~
/**
* Port where the server runs. Defaults to <b>8081</b>.
*
* @@param port
*/
public void setPort(int port)
{
    this.serverPort = port;
}
~~~~~~

**4.3.4:**

~~~~~~
/*

RFC 4648                    Base-N Encodings                October 2006


1.  Introduction

   Base encoding of data is used in many situations to store or transfer
   data in environments that, perhaps for legacy reasons, are restricted
   to US-ASCII [1] data.  Base encoding can also be used in new
   applications that do not have legacy restrictions, simply because it
   makes it possible to manipulate objects with text editors.

   In the past, different applications have had different requirements
   and thus sometimes implemented base encodings in slightly different
   ways.  Today, protocol specifications sometimes use base encodings in
   general, and "base64" in particular, without a precise description or
   reference.  Multipurpose Internet Mail Extensions (MIME) [4] is often
   used as a reference for base64 without considering the consequences
   for line-wrapping or non-alphabet characters.  The purpose of this
   specification is to establish common alphabet and encoding
   considerations.  This will hopefully reduce ambiguity in other
   documents, leading to better interoperability.

   (... THIS COMMENT GOES ON. IT IS A COPY AND PASTE OF THE RFC...)
*/

public class BaseNEncoder(){

    public string ToBase64(string data){
         (...)
    }

    public string ToBase32(string data){
         (...)
    }
}
~~~~~~
